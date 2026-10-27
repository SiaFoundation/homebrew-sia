class Renterd < Formula
  desc "Renting application for the Sia network"
  homepage "https://github.com/SiaFoundation/renterd"
  url "https://github.com/SiaFoundation/renterd.git",
      tag:      "v2.9.5",
      revision: "88fa4aefe617a7ff784f8fa0e05bf4041b9c50b5"

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
