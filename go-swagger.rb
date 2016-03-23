class GoSwagger < Formula
  desc "Toolkit to work with swagger for golang"
  homepage "https://github.com/go-swagger/go-swagger"
  url "https://github.com/go-swagger/go-swagger/releases/download/0.5.0/swagger_darwin_amd64"
  version "0.5.0"
  sha256 "cdc9e73c6dae1a390028dd07ef48cc0d32edb59d883ed49b78174def97f9b6d4"

  def install
    system "mv", "swagger_darwin_amd64", "swagger"
    bin.install "swagger"
  end

  test do
    system "#{bin}/swagger", "version"
  end
end
