import argparse
import re
import shutil
import subprocess
import sys
from pathlib import Path


class StowPackage:
    def __init__(self, path: str):
        self.path = path

    def is_valid(self) -> tuple[bool, str]:
        STOW_PACKAGE_PATH_VALIDATION_REGEX = r"[A-Za-z0-9_][A-Za-z0-9_.-]*(/[A-Za-z0-9_][A-Za-z0-9_.-]*)*"
        if not re.fullmatch(STOW_PACKAGE_PATH_VALIDATION_REGEX, self.path):
            return False, "invalid package path"

        package_dir = Path(__file__).resolve().parent / "packages" / self.path
        if not package_dir.is_dir():
            return False, "package directory does not exist"
        if not (package_dir / ".stow-local-ignore").is_file():
            return False, "missing .stow-local-ignore"
        return True, ""

    def install(self, dry_run: bool, target_dir: str) -> None:
        valid, reason = self.is_valid()
        if not valid:
            raise ValueError(f"Invalid package {self.path}: {reason}")

        package_dir = Path(__file__).resolve().parent / "packages" / self.path
        command = ["stow", "--stow", "--verbose", "--no-folding"]
        if dry_run:
            command.append("--simulate")
        command.extend([
            f"--dir={package_dir.parent}",
            f"--target={target_dir}",
            package_dir.name,
        ])
        print(f"Stowing {self.path}", flush=True)
        subprocess.run(command, check=True)


class Config:
    dry_run: bool
    profile: str
    packages: list[StowPackage]
    target_dir: str


def package_list(value: str) -> str:
    if not value or any(not package.strip() for package in value.split(",")):
        raise argparse.ArgumentTypeError(
            "--include-packages requires a comma-separated list without empty entries"
        )
    return value


def get_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser()
    parser.add_argument("--dry-run", action="store_true")
    parser.add_argument(
        "--include-packages", action="append", type=package_list,
        help="comma-separated packages to add to the profile",
    )
    parser.add_argument("--target", default=str(Path.home()))
    parser.add_argument("profile", help="profile name from profiles/")

    args = parser.parse_args()
    return args

def get_packages_from_profile(profile: str) -> list[StowPackage]:
    PROFILE_NAME_VALIDATION_REGEX = r"[A-Za-z0-9_][A-Za-z0-9_./-]*"
    if not re.fullmatch(PROFILE_NAME_VALIDATION_REGEX, profile):
        raise ValueError(f"Invalid profile name: {profile}")

    packages = []
    profile_path = Path(__file__).resolve().parent / "profiles" / profile
    if not profile_path.is_file():
        raise FileNotFoundError(f"Profile not found: {profile_path}")
    with open(profile_path) as f:
        for line in f:
            package = line.split("#", 1)[0].strip()
            if package:
                packages.append(StowPackage(package))
    return packages

def get_config(args: argparse.Namespace) -> Config:
    config = Config()
    config.dry_run = args.dry_run
    config.profile = args.profile
    package_names = [package.path for package in get_packages_from_profile(args.profile)]
    for include_list in args.include_packages or []:
        package_names.extend(package.strip() for package in include_list.split(","))
    config.packages = [StowPackage(name) for name in dict.fromkeys(package_names)]

    target_path = Path(args.target).expanduser()
    if not target_path.is_dir():
        raise ValueError(f"Target directory does not exist: {target_path}")
    config.target_dir = str(target_path.resolve())

    return config

def validate_packages(packages: list[StowPackage]) -> None:
    if not packages:
        print("No packages. There is nothing to do.")
        sys.exit(0)
    all_valid = True
    for package in packages:
        valid, reason = package.is_valid()
        if not valid:
            all_valid = False
            print(f"Package {package.path} is invalid! Reason: {reason}", file=sys.stderr)
    if not all_valid:
        raise RuntimeError("Validation of packages failed.")


def check_stow() -> None:
    if shutil.which("stow") is None:
        raise RuntimeError("GNU Stow is required but was not found in PATH.")

def main():
    args = get_args()
    try:
        check_stow()
        config = get_config(args)
        validate_packages(config.packages)
        for package in config.packages:
            package.install(config.dry_run, config.target_dir)
    except (ValueError, OSError, RuntimeError, subprocess.CalledProcessError) as exc:
        raise SystemExit(f"Error: {exc}") from exc


if __name__ == "__main__":
    main()
