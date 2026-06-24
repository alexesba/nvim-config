return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        sql = { "sqlformat", stop_after_first = true },
        json = { "json_tool" },
        xml = { "xml_minidom" },
      },
      formatters = {
        sqlformat = {
          command = "sqlformat",
          args = { "--reindent", "--keywords", "upper", "--identifiers", "lower", "-" },
        },
        sql_formatter_cli = {
          command = "sql-formatter-cli",
        },
        json_tool = {
          command = "python3",
          args = { "-m", "json.tool" },
        },
        xml_minidom = {
          command = "python3",
          args = {
            "-c",
            "import xml.dom.minidom, sys; print(xml.dom.minidom.parse(sys.stdin).toprettyxml())",
          },
        },
      },
    },
  },
}
