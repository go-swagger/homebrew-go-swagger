class GoSwagger < Formula
  desc "Toolkit to work with swagger for golang"
  homepage "https://github.com/go-swagger/go-swagger"
  url "https://github.com/go-swagger/go-swagger/releases/download/0.6.0/swagger_darwin_amd64"
  version "0.6.0"
  sha256 "bd500cebf0bef99ea5d4e2db88e2733be2f92ca5879de27fccf6454c7e7d8f9e"

  def install
    system "mv", "swagger_darwin_amd64", "swagger"
    bin.install "swagger"
  end

  test do
    system "#{bin}/swagger", "version"
  end
end
