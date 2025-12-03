# Set main file and build dir
src := 'main.tex'
build_dir := 'build'
pdf := '{build_dir}/main.pdf'

all:
    mkdir -p {{build_dir}}
    tectonic -o {{build_dir}} main.tex

watch:
    watchexec --restart --stop-signal SIGKILL --exts tex --ignore {{build_dir}} 'just all'

clean:
	rm -rf {{build_dir}} 
