class GoSwagger < Formula
  desc "Toolkit to work with swagger for golang"
  homepage "https://github.com/go-swagger/go-swagger"
  url "https://github.com/go-swagger/go-swagger/releases/download/v0.20.0/swagger_darwin_amd64"
  version "0.20.0"
  sha256 "95f10f727a607e8a00e8766797bf97509f9b020ef8957cba3ed541d67b2f5fde"

  option "with-goswagger", "Names the binary goswagger instead of swagger"

  def install
    nm = "swagger"
    if build.with? "goswagger"
      nm = "goswagger"
    end
    system "mv", "swagger_darwin_amd64", nm
    bin.install nm
  end

  test do
    if build.with? "goswagger"
      system "#{bin}/goswagger", "version"
    else
      system "#{bin}/swagger", "version"
    end
  end
end
