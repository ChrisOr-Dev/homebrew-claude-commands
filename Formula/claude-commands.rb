class ClaudeCommands < Formula
  desc "Optimized custom commands for Claude Code"
  homepage "https://github.com/ChrisOr-Dev/claude-commands"
  url "https://github.com/ChrisOr-Dev/claude-commands/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "e4f696edcbd0d066fdf9cf84fb16422267b41c994734151ef50c9b9f41cd3b26"
  license "MIT"

  def install
    libexec.install Dir["last-word"]
    libexec.install Dir["context-doctor"]
    libexec.install Dir["ping-claude"]
    libexec.install Dir["legislate"]
    libexec.install "install.sh"
    libexec.install "uninstall.sh"

    (bin/"claude-commands").write <<~EOS
      #!/bin/bash
      exec "#{libexec}/install.sh" "$@"
    EOS
  end

  def post_install
    system bin/"claude-commands", "--all"
  end

  def caveats
    <<~EOS
      Commands have been installed to ~/.claude/commands/
      Available: /last-word, /context-doctor, /ping-claude, /legislate
    EOS
  end
end
