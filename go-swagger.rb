class GoSwagger < Formula
  desc "Toolkit to work with swagger for golang"
  homepage "https://github.com/go-swagger/go-swagger"
  url "https://github.com/go-swagger/go-swagger/releases/download/0.7.4/swagger_darwin_amd64"
  version "0.7.4"
  sha256 "0a16f15fd4de30c9f538d32bb0b2d935314b02b9dc398008a7f02688c0501bcb"

  def install
    system "mv", "swagger_darwin_amd64", "swagger"
    bin.install "swagger"
  end

  test do
    system "#{bin}/swagger", "version"
  end
end
