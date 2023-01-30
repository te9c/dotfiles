vim.keymap.set("n","cmg","<plug>(CMakeGenerate)")
vim.keymap.set("n","cmc","<plug>(CMakeClean)")
vim.keymap.set("n","cmb","<plug>(CMakeBuild)")
vim.keymap.set("n","cmt","<plug>(CMakeTest)")
vim.keymap.set("n","cmo","<plug>(CMakeOpen)")
vim.keymap.set("n","cml","<plug>(CMakeClose)")

vim.g.cmake_build_dir_location = "./build"
vim.g.cmake_test_options = {'--output-on-failure', '-V'}
