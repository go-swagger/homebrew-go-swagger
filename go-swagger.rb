class GoSwagger < Formula
  desc "Toolkit to work with swagger for golang"
  homepage "https://github.com/go-swagger/go-swagger"
  url "https://github.com/go-swagger/go-swagger/releases/download/0.8.0/swagger_darwin_amd64"
  version "0.8.0"
  sha256 "c030135355bb2224eafa47bb564c1878b7571d847e65c90df844a9101c397004"

  def install
    system "mv", "swagger_darwin_amd64", "swagger"
    bin.install "swagger"
  end

  test do
    system "#{bin}/swagger", "version"
  end
end
