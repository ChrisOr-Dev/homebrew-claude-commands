class ClaudeCommands < Formula
  desc "Optimized custom commands for Claude Code"
  homepage "https://github.com/ChrisOr-Dev/claude-commands"
  url "https://github.com/ChrisOr-Dev/claude-commands/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "a36923c67f8addec5420727f91e5122d8682dc6e6acca21b8a83f898d7e371ae"
  license "MIT"

  def install
    libexec.install Dir["last-word"]
    libexec.install Dir["context-doctor"]
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
      Available: /last-word, /context-doctor
    EOS
  end
end
