class Tai < Formula
  desc "Cross-platform terminal AI assistant with guarded command execution"
  homepage "https://tai.ippa.se"
  version "2.0.0"

  on_macos do
    on_arm do
      url "https://github.com/ippa/homebrew-tap/releases/download/tai-v2.0.0/tai_2.0.0_darwin_arm64.tar.gz"
      sha256 "69fd5ce2a2a0155a6da2b10e7ba8c154f1f2737437bcae47fe76d77f92167f47"
    end
    on_intel do
      url "https://github.com/ippa/homebrew-tap/releases/download/tai-v2.0.0/tai_2.0.0_darwin_x64.tar.gz"
      sha256 "e2ed804e51a9ff9b3b72eb807db281215d43b9ab02b920819d233e476e4ae056"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ippa/homebrew-tap/releases/download/tai-v2.0.0/tai_2.0.0_linux_arm64.tar.gz"
      sha256 "900422d621230099fbe1593e71f0652fca9e01855470c18ee6cd836986b44dc8"
    end
    on_intel do
      url "https://github.com/ippa/homebrew-tap/releases/download/tai-v2.0.0/tai_2.0.0_linux_x64.tar.gz"
      sha256 "434ce642f4a535abe29dc8f21e7dbd0638aa67def73e38eac2040c9ea441ac4b"
    end
  end

  def install
    bin.install "tai"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tai --version")
  end
end
