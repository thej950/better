# ----------- Stage 1: Build Stage -------------
FROM node:18 AS builder

WORKDIR /app

# Copy source files 
COPY . .

# Initialize package.json and install dependencies
RUN npm init -y && \
    npm install express

# ----------- Stage 2: Runtime Stage (Alpine) -------------
FROM node:18-alpine

WORKDIR /app

# Copy only necessary files from the builder
COPY --from=builder /app /app

# Expose app port
EXPOSE 3000

# Start the application
CMD ["node", "server.js"]
