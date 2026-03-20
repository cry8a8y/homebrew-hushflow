class Hushflow < Formula
  desc "Turn AI thinking time into mindful breathing"
  homepage "https://github.com/cry8a8y/HushFlow"
  url "https://github.com/cry8a8y/HushFlow/archive/refs/tags/v2.1.0.tar.gz"
  sha256 "3178a1157f14a7a151013af6200aa89dbca5c42ea4348d0e2f1e813d9d151376"
  license "MIT"

  depends_on "jq"

  def install
    libexec.install Dir["*"]
    (bin/"hushflow").write <<~SH
      #!/bin/bash
      exec bash "#{libexec}/cli.sh" "$@"
    SH
  end

  def caveats
    <<~EOS
      To register HushFlow hooks with your AI tools, run:
        hushflow install

      This will set up automatic breathing animations for
      Claude Code, Gemini CLI, and/or Codex CLI.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hushflow --version")
  end
end
