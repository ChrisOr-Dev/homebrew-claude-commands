class ClaudeCommands < Formula
  desc "Optimized custom commands for Claude Code"
  homepage "https://github.com/ChrisOr-Dev/claude-commands"
  url "https://github.com/ChrisOr-Dev/claude-commands/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "d207da592b56f964ea3875cff24f9f8b9e7a03215f4dabc8768b5838c4374a0f"
  license "MIT"

  def install
    libexec.install Dir["last-word"]
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
      Use /last-word in Claude Code to run.
    EOS
  end
end
