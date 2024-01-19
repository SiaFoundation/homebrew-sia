class Renterd < Formula
  desc "Renterd: The Next-Gen Sia Renter"
  homepage "https://github.com/SiaFoundation/renterd"
  url "https://github.com/SiaFoundation/renterd.git", :tag => "v1.0.2"

  depends_on "go" => :build

  def install
    system "go", "generate", "./..."
    system "go", "build", "-tags='netgo'", "-o", bin/"renterd", "-a", "-ldflags", "-s -w", "./cmd/renterd"
  end

  test do
    system "#{bin}/renterd", "version"
  end
end

