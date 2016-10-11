class GoSwagger < Formula
  desc "Toolkit to work with swagger for golang"
  homepage "https://github.com/go-swagger/go-swagger"
  url "https://github.com/go-swagger/go-swagger/releases/download/0.7.2/swagger_darwin_amd64"
  version "0.7.2"
  sha256 "12ca4ef73098458f1cd434a38d7b8366931b0891bafd0446e0427828429d7efa"

  def install
    system "mv", "swagger_darwin_amd64", "swagger"
    bin.install "swagger"
  end

  test do
    system "#{bin}/swagger", "version"
  end
end
