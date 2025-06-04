return {
  "pmizio/typescript-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  event = { "BufRead *.tsx", "BufRead *.ts", "BufRead *.jsx", "BufRead *.js" },
  opts = {
    settings = {
      tsserver_format_options = {
        insertSpaceAfterCommaDelimiter = false,
        insertSpaceAfterConstructor = false,
        insertSpaceAfterSemicolonInForStatements = false,
        insertSpaceBeforeAndAfterBinaryOperators = false,
        insertSpaceAfterKeywordsInControlFlowStatements = false,
        insertSpaceAfterFunctionKeywordForAnonymousFunctions = false,
        insertSpaceBeforeFunctionParenthesis = false,
        insertSpaceAfterOpeningAndBeforeClosingNonemptyParenthesis = false,
        insertSpaceAfterOpeningAndBeforeClosingNonemptyBrackets = false,
        insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces = false,
        insertSpaceAfterOpeningAndBeforeClosingEmptyBraces = false,
        insertSpaceAfterOpeningAndBeforeClosingTemplateStringBraces = false,
        insertSpaceAfterOpeningAndBeforeClosingJsxExpressionBraces = false,
        insertSpaceAfterTypeAssertion = false,
        placeOpenBraceOnNewLineForFunctions = false,
        placeOpenBraceOnNewLineForControlBlocks = false,
        semicolons = "ignore",
        indentSwitchCase = false,
      },
    }
  },
}
