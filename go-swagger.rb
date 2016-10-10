class GoSwagger < Formula
  desc "Toolkit to work with swagger for golang"
  homepage "https://github.com/go-swagger/go-swagger"
  url "https://github.com/go-swagger/go-swagger/releases/download/0.7.1/swagger_darwin_amd64"
  version "0.7.1"
  sha256 "db82e976546853a0ef70c540b845efeb7723f41539c87550531a7410d81c9405"

  def install
    system "mv", "swagger_darwin_amd64", "swagger"
    bin.install "swagger"
  end

  test do
    system "#{bin}/swagger", "version"
  end
end
