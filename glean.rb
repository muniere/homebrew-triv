class Glean < Formula
  desc "Glean is a web crawler with Server-Client style."
  homepage "https://github.com/muniere/glean"
  url "https://github.com/muniere/glean/archive/v0.1.0.tar.gz"
  sha256 "9066cc7fe3df1224c668c8fcb97def6aa5978a314bcefa226542058511c0f47b"
  head "https://github.com/muniere/glean.git"

  depends_on "dep" => :build
  depends_on "go" => :build

  def data_dir
    var/"glean"
  end

  def log_dir
    var/"log"/"glean"
  end

  def install
    ENV["GOPATH"] = buildpath

    srcpath = buildpath/"src/github.com/muniere/glean/"
    srcpath.install buildpath.children

    cd srcpath do
      system "make deps"
      system "make"
      bin.install [".bin/glean", ".bin/gleand"]
    end

    mkdir_p log_dir
  end

  def plist; <<~EOS
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
      <key>KeepAlive</key>
      <true/>
      <key>Label</key>
      <string>#{plist_name}</string>
      <key>ProgramArguments</key>
      <array>
        <string>#{opt_bin}/gleand</string>
        <string>--data-dir=#{data_dir}</string>
        <string>--log-dir=#{log_dir}</string>
      </array>
      <key>RunAtLoad</key>
      <true/>
      <key>WorkingDirectory</key>
      <string>#{data_dir}</string>
    </dict>
    </plist>
  EOS
  end

  test do
    system "glean", "--help"
  end
end

