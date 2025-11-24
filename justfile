# Set main file and build dir
src := 'main.tex'
build_dir := 'build'
pdf := '{build_dir}/main.pdf'

all:
    mkdir -p {{build_dir}}
    pdflatex -output-directory={{build_dir}} {{src}}
    pdflatex -output-directory={{build_dir}} {{src}}
watch:
	watchexec --restart --stop-signal SIGKILL --exts tex -- 'just all '

copy location:
   cp build/main.pdf {{location}}
clean:
	rm -rf {{build_dir}} 


