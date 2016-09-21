class GenisysCinemagraph < Formula
  VERSION = "1.0.0"

  desc "Make the genisys background a cinemagraph"
  url "https://github.com/octoblu/genisys-cinemagraph/archive/v#{VERSION}.tar.gz"
  sha256 "002db8b3b34f88bf4b6501c0605ade16bb8b75d9217418349b4d47cd2b5ec45f"
  depends_on 'coreutils'

  def install
    inreplace "genisys-cinemagraph.sh", 'local directory="$(script_directory)"', ""
    inreplace "genisys-cinemagraph.sh", 'local version=$(cat "$directory/VERSION")', "local version=\"#{VERSION}\""

    copy "genisys-cinemagraph.sh", "genisys-cinemagraph"
    copy "genisys-cinemagraph.sh", "gc"

    bin.install "genisys-cinemagraph"
    bin.install "gc"
  end

  test do
    assert_equal "#{VERSION}", shell_output("#{bin}/gc --version").strip
    assert_equal "#{VERSION}", shell_output("#{bin}/genisys-cinemagraph --version").strip
  end
end
