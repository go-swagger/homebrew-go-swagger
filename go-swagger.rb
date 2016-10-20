class GoSwagger < Formula
  desc "Toolkit to work with swagger for golang"
  homepage "https://github.com/go-swagger/go-swagger"
  url "https://github.com/go-swagger/go-swagger/releases/download/0.7.3/swagger_darwin_amd64"
  version "0.7.3"
  sha256 "3b35afac723bf81bec76bae8cd0f6a23c244623a2821dbdb3e680400f99568fc"

  def install
    system "mv", "swagger_darwin_amd64", "swagger"
    bin.install "swagger"
  end

  test do
    system "#{bin}/swagger", "version"
  end
end
