class GoSwagger < Formula
  desc "Toolkit to work with swagger for golang"
  homepage "https://github.com/go-swagger/go-swagger"
  url "https://github.com/go-swagger/go-swagger/releases/download/0.7.0/swagger_darwin_amd64"
  version "0.7.0"
  sha256 "2e0f5789541e870df9e715921fabb7849319982a9f3acb5a57be655612f3cacd"

  def install
    system "mv", "swagger_darwin_amd64", "swagger"
    bin.install "swagger"
  end

  test do
    system "#{bin}/swagger", "version"
  end
end
