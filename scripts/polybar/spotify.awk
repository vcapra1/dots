/string  *"xesam:title/{
    while(1) {
        getline line
        if (line ~ /string "/) {
            sub(/.*string "/, "title:", line)
            sub(/" *$/, "", line)
            sub(/title: */, "", line)
            printf "%{T7}"
            printf line
            printf "%{T1} - "
            break
        }
    }
}
/string  *"xesam:artist/{
    while (1) {
        getline line
        if (line ~ /string "/) {
            sub(/.*string "/, "artist:", line)
            sub(/" *$/, "", line)
            sub(/artist: */, "", line)
            printf line
            print ""
            break
        }
    }
}
