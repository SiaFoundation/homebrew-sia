class S3d < Formula
  desc "Lightweight, S3-compatible Renter for the Sia network"
  homepage "https://github.com/SiaFoundation/s3d"
  url "https://github.com/SiaFoundation/s3d.git",
      tag:      "v0.2.1",
      revision: "312789a9e6d17eea725e3cd66d2d2a4f60602bb0"

  depends_on "gcc" => :build
  depends_on "go" => :build

  def install
    system "go", "generate", "./..."
    system "go", "build", "-tags='netgo'", "-trimpath", "-o", bin/"s3d",
           "-a", "-ldflags", "-s -w", "./cmd/s3d"
  end

  test do
    system "#{bin}/s3d", "version"
  end
end
