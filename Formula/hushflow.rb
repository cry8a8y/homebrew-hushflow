class Hushflow < Formula
  desc "Turn AI thinking time into mindful breathing"
  homepage "https://github.com/cry8a8y/HushFlow"
  url "https://github.com/cry8a8y/HushFlow/archive/refs/tags/v2.0.0.tar.gz"
  sha256 "9b1c124807100e2bf40dd6d053d6fe99d8ea7fc75ede8e4e849cb0def154ea01"
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
