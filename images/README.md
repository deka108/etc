# Images

## ImageMagick

```
brew install imagemagick ghostscript gifsicle
```

## Image Edits

Cropping GIF:

https://stackoverflow.com/questions/14036765/how-do-i-crop-an-animated-gif-using-imagemagick

## Mov 2 GIF Generation

`brew install ffmpeg`

Got this hack from my TL

```
movtogif () {
	tempfile=.mov-to-gif-$(date +"%s").png
	ffmpeg -i $1 -vf "scale=800:-2" "${1%.mov}-resized.mov"
	ffmpeg -stats -y -i "${1%.mov}-resized.mov" -vf fps=10,palettegen $tempfile
	ffmpeg -stats -i "${1%.mov}-resized.mov" -i $tempfile -filter_complex "fps=10,paletteuse" "${1%.mov}.gif"
	rm $tempfile "${1%.mov}-resized.mov"
}
```

Other src: https://superuser.com/questions/436056/how-can-i-get-ffmpeg-to-convert-a-mov-to-a-gif
