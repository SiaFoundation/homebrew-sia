class Renterd < Formula
  desc "Renting application for the Sia network"
  homepage "https://github.com/SiaFoundation/renterd"
  url "https://github.com/SiaFoundation/renterd.git",
      tag:      "v2.9.6",
      revision: "457ecf30cd8675e95b0ac56726de02fbe853e45d"

  depends_on "gcc" => :build
  depends_on "go" => :build

  def install
    system "go", "generate", "./..."
    system "go", "build", "-tags='netgo'", "-trimpath", "-o", bin/"renterd",
           "-a", "-ldflags", "-s -w", "./cmd/renterd"
  end

  test do
    system "#{bin}/renterd", "version"
  end
end
