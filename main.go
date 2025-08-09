package main

import (
	"github.com/gin-gonic/gin"
)

func main() {
	router := gin.Default()
	router.SetTrustedProxies([]string{"127.0.0.1"})

	router.GET("/albums", getAlbums)
	router.POST("/albums", postAlbum)
	router.GET("/album/:id", getAlbum)

	router.Run(":8080")
}
