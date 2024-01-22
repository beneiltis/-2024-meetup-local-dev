package main

import (
	"fmt"
	"time"

	"github.com/gin-gonic/gin"
)

func main() {
	gin.SetMode(gin.ReleaseMode)
	r := gin.Default()
	r.GET("/healthz", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"message": time.Now().Unix(),
		})
	})
	fmt.Println("Server started on port 8080 🚀")
	r.Run()
}
