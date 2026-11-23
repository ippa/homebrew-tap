class Tai < Formula
  desc "Cross-platform terminal AI assistant with guarded command execution"
  homepage "https://tai.ippa.se"
  version "2.1.0"

  on_macos do
    on_arm do
      url "https://github.com/ippa/homebrew-tap/releases/download/tai-v2.1.0/tai_2.1.0_darwin_arm64.tar.gz"
      sha256 "34620193c292939cdbd052ac5fc61fae265a2247175e0e2c34d9656b31f06f15"
    end
    on_intel do
      url "https://github.com/ippa/homebrew-tap/releases/download/tai-v2.1.0/tai_2.1.0_darwin_x64.tar.gz"
      sha256 "58bf7d391da5cd34884f0df2223fd1aa3a7f80603ec33e88cea61ee21171a158"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ippa/homebrew-tap/releases/download/tai-v2.1.0/tai_2.1.0_linux_arm64.tar.gz"
      sha256 "c085b1ef0f29e08a9798d12b97879803b40b0e72834d3dbb1f139eb51e54179c"
    end
    on_intel do
      url "https://github.com/ippa/homebrew-tap/releases/download/tai-v2.1.0/tai_2.1.0_linux_x64.tar.gz"
      sha256 "4d052c8a9700f036c29956076d0fb3925b1e23396cce8780a2ca3073ad88cfe1"
    end
  end

  def install
    bin.install "tai"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tai --version")
  end
end
