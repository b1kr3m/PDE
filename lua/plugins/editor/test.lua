return {
  -- Neotest is enabled through lazyvim.plugins.extras.test.core.
  -- These adapters run tests directly and do not enable DAP.
  {
    "nvim-neotest/neotest-python",
  },
  {
    "nvim-neotest/neotest-go",
  },
  {
    "nvim-neotest/neotest",
    opts = {
      adapters = {
        ["neotest-python"] = {
          runner = "pytest",
        },
        ["neotest-go"] = {
          args = { "-count=1" },
        },
      },
    },
  },
}
