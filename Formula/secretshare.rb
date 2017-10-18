class Secretshare < Formula
  desc "Share secrets securely"
  homepage "https://github.com/waucka/secretshare"
  url "https://github.com/waucka/secretshare/releases/download/1.0.0/osx-secretshare", :using => :nounzip
  sha256 "098e22343d8835b0ea2e662c433fd95b40953e166f640ec834325a783ce5891d"

  def install
    mv 'osx-secretshare', 'secretshare'
    chmod 0755, 'secretshare'
    bin.install "secretshare"
  end

  test do
    ENV['HOME'] = testpath.to_s
    #system "#{bin}/secretshare", "--help"
    system "#{bin}/secretshare", 'config', '--endpoint', 'test'
    system "cat", ".secretsharerc"
    require 'json'
    ss_cfg = JSON.load(File.open('.secretsharerc'))
    return ss_cfg['endpointBaseUrl'] == 'test'
  end
end
