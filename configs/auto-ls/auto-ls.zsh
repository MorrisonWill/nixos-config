my-accept-line () {
    # check if the buffer does not contain any words
    if [ -z ${BUFFER} ]; then
	# put ls in buffer
	BUFFER="exa"
    fi
    # run the `accept-line' widget
    zle accept-line
}
# create a widget from `my-accept-line' with the same name
zle -N my-accept-line
# rebind Enter, usually this is `^M'
bindkey '^M' my-accept-line
