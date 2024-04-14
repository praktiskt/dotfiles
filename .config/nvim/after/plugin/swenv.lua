vim.api.nvim_create_user_command("PythonVenv", require("swenv.api").pick_venv, {})
