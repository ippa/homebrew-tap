class Tai < Formula
  desc "Cross-platform terminal AI assistant with guarded command execution"
  homepage "https://tai.ippa.se"
  version "3.0.0"

  on_macos do
    on_arm do
      url "https://github.com/ippa/homebrew-tap/releases/download/tai-v3.0.0/tai_3.0.0_darwin_arm64.tar.gz"
      sha256 "2d371f05c894e28ec88864ad9e2cf97c3416c01b904bfa19eb786dcbde468cb9"
    end
    on_intel do
      url "https://github.com/ippa/homebrew-tap/releases/download/tai-v3.0.0/tai_3.0.0_darwin_x64.tar.gz"
      sha256 "2a4a3704b5ba2d3930083aff4a576f6d15eb153dce9c3081a6491fa763b87cda"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ippa/homebrew-tap/releases/download/tai-v3.0.0/tai_3.0.0_linux_arm64.tar.gz"
      sha256 "d7bcf307b9eff5c1016e05a46e7fad40cca019ca9897aa10ef572749c5b926b8"
    end
    on_intel do
      url "https://github.com/ippa/homebrew-tap/releases/download/tai-v3.0.0/tai_3.0.0_linux_x64.tar.gz"
      sha256 "9665190df259855fb197571b1fe28c0b566c1ccbf66722b75e8ed1d9e56bd557"
    end
  end

  def install
    bin.install "tai"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tai --version")
  end
end
