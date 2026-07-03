class ClaudeCommands < Formula
  desc "Optimized custom commands for Claude Code"
  homepage "https://github.com/ChrisOr-Dev/claude-commands"
  url "https://github.com/ChrisOr-Dev/claude-commands/archive/refs/tags/v1.3.1.tar.gz"
  sha256 "8b243980b3fcd9fb9ec420d878effe8d8e3fd31568490205bb52df948d5a3fed"
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
