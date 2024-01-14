local M = {}

M.dap = {
    n = {
        ["<leader>db"] = {
            "<cmd>DapToggleBreakpoint <CR>",
            "Toggle breakpoint"
        },
        ["<leader>dus"] = {
            function()
                local widgets = require('dap.ui.widgets');
                local sidebar = widgets.sidebar(widgets.scopes);
                sidebar.open();
            end,
            "Open dubugging sidebar"
        },
    }
}

M.crates = {
    n = {
        ["<leader>rcu"] = {
            function ()
                require('crates').upgrade_all_crates()
            end,
            "Update crates"
        }
    }
}

M.wilder = {
    n = {
        ["<leader>n"] = {
            ":e ~/"
        }
    }
}



return M
