class Tai < Formula
  desc "Cross-platform terminal AI assistant with guarded command execution"
  homepage "https://tai.ippa.se"
  version "2.2.1"

  on_macos do
    on_arm do
      url "https://github.com/ippa/homebrew-tap/releases/download/tai-v2.2.1/tai_2.2.1_darwin_arm64.tar.gz"
      sha256 "f5d1eb9d038b565d63a984f4e0fae1e1cf2c0dfa6a82a34e079ec127a26e2e08"
    end
    on_intel do
      url "https://github.com/ippa/homebrew-tap/releases/download/tai-v2.2.1/tai_2.2.1_darwin_x64.tar.gz"
      sha256 "cd8d783c7ea7eb2c20d41a275689b53681f81ac714b9783dbd83c713c70fc9d1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ippa/homebrew-tap/releases/download/tai-v2.2.1/tai_2.2.1_linux_arm64.tar.gz"
      sha256 "b329c47b19b7650532f9e288f78405da949285e37e519dac8b6ae32a3a8181cc"
    end
    on_intel do
      url "https://github.com/ippa/homebrew-tap/releases/download/tai-v2.2.1/tai_2.2.1_linux_x64.tar.gz"
      sha256 "04e8a74164604f1e830590c105671063d86cf3474725edf1c3b62a121785e2f2"
    end
  end

  def install
    bin.install "tai"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tai --version")
  end
end
