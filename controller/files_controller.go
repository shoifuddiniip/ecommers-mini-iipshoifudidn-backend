package controller

import (
	"io"
	"net/http"
	"os"
	"strings"
)

// Download file dari folder files
func DownloadFile(w http.ResponseWriter, r *http.Request) {
	filePath := r.URL.Path
	idx := strings.Index(filePath, "/files/")
	if idx == -1 {
		http.NotFound(w, r)
		return
	}
	fileName := filePath[idx+len("/files/"):]
	if fileName == "" {
		http.NotFound(w, r)
		return
	}
	fullPath := "files/" + fileName
	f, err := os.Open(fullPath)
	if err != nil {
		http.NotFound(w, r)
		return
	}
	defer f.Close()
	w.Header().Set("Content-Disposition", "attachment; filename="+fileName)
	w.Header().Set("Content-Type", "application/octet-stream")
	io.Copy(w, f)
}
