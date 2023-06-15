FROM golang:1.17-alpine3.15

# Disable CGO to build a statically linked Go binary
ENV CGO_ENABLED=0

# Set the working directory inside the container
WORKDIR /app

# Copy the go.mod and go.sum files to the working directory
COPY go.mod go.sum ./

# Download the Go module dependencies
RUN go mod download

# Copy the entire project to the working directory
COPY . .

# Navigate to the server directory within the project
RUN cd services/server && go build -o server .

# Expose port 8070 to allow external access
EXPOSE 8070

# Set the command to run the server binary when the container starts
CMD ["/app/services/server/server"]
