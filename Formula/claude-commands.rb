class ClaudeCommands < Formula
  desc "Optimized custom commands for Claude Code"
  homepage "https://github.com/ChrisOr-Dev/claude-commands"
  url "https://github.com/ChrisOr-Dev/claude-commands/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "5dae36031abfee75942d054c3df15ed8af7c42117a3bd45abf08b8b37a178b4f"
  license "MIT"

  def install
    libexec.install Dir["last-word"]
    libexec.install Dir["context-doctor"]
    libexec.install Dir["ping-claude"]
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
      Available: /last-word, /context-doctor, /ping-claude
    EOS
  end
end
