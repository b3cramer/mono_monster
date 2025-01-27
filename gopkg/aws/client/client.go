package awsclient

import (
	"context"

	"github.com/aws/aws-sdk-go-v2/aws"
	log "github.com/sirupsen/logrus"
)

type Client struct {
	cfg aws.Config
}

// Returns a new AWS Client based on the region specified
func New(ctx context.Context, region string) *Client {
	c := aws.NewConfig()
	c.Region = region
	if c.Credentials == nil {
		log.Error("AWS credentials not found")
	}
	return &Client{
		cfg: *c,
	}
}