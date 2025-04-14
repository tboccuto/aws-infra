# AWS Services Terraform Catalog

## Services Catalog

### Compute Services
- **EC2** - Virtual servers with various instance types, AMIs, and advanced features
  - EC2 with user data and Certbot [x]
  - Spot instances
  - Reserved instances
  - Auto Scaling Groups
  - Launch Templates

- **Lambda** - Serverless compute
  - Multiple runtime environments (Node.js, Python, Java, etc.)
  - Environment variables
  - Various triggers (API Gateway, S3, etc.)
  - Custom layers

- **ECS** - Container orchestration
  - Fargate launch type (serverless)
  - EC2 launch type
  - Task definitions and services

- **EKS** - Managed Kubernetes
  - Managed node groups
  - Self-managed nodes
  - Cluster autoscaler

- **Batch** - Batch computing workloads
  - Job definitions
  - Compute environments
  - Job queues

- **Lightsail** - Simplified virtual private servers

### Containers

- **ECR** - Container registry
  - Image scanning
  - Lifecycle policies
  - Cross-region replication

- **App Runner** - Containerized application service
  - Automatic deployments
  - Auto-scaling

- **ECS Anywhere** - On-premises container management

### Storage

- **S3** - Object storage
  - Various storage classes
  - Lifecycle policies
  - Event notifications
  - Versioning
  - Replication

- **EFS** - Scalable file storage
  - Performance modes
  - Throughput modes
  - Access points

- **FSx** - Managed file systems
  - Windows File Server
  - Lustre

- **Storage Gateway** - Hybrid cloud storage
  - File Gateway
  - Volume Gateway
  - Tape Gateway

- **Snow Family** - Edge computing and data transfer
  - Snowball
  - Snowcone

### Database

- **RDS** - Relational databases
  - MySQL
  - PostgreSQL
  - SQL Server
  - Oracle
  - MariaDB
  - Multi-AZ deployments
  - Read replicas

- **Aurora** - High-performance database
  - Serverless configuration
  - Global database
  - Custom endpoints

- **DynamoDB** - NoSQL database
  - Auto-scaling
  - Global tables
  - Streams
  - DAX (Accelerator)

- **DocumentDB** - MongoDB-compatible document database

- **Neptune** - Graph database

- **Timestream** - Time-series database

- **QLDB** - Ledger database

- **Keyspaces** - Apache Cassandra-compatible database

### Networking

- **VPC** - Virtual Private Cloud
  - Custom CIDR blocks
  - Multiple subnets
  - Route tables
  - Network ACLs
  - Security groups

- **Transit Gateway** - Network transit hub

- **VPC Peering** - Connect VPCs

- **Direct Connect** - Dedicated network connections

- **Global Accelerator** - Improve availability and performance

- **PrivateLink** - Private connectivity

- **Network Firewall** - Network traffic filtering

### Content Delivery

- **CloudFront** - CDN
  - Origin Access Identity
  - Lambda@Edge
  - Geo-restrictions

- **MediaStore** - Video origination and storage

- **MediaConvert** - File-based video transcoding

- **MediaLive** - Live video processing

### Machine Learning

- **SageMaker** - Build, train, and deploy ML models
  - Notebook instances
  - Training jobs
  - Endpoints

- **Comprehend** - Natural language processing

- **Rekognition** - Image and video analysis

- **Polly** - Text-to-speech

- **Transcribe** - Speech-to-text

- **Forecast** - Time-series forecasting

### Analytics

- **Athena** - Query S3 data with SQL

- **EMR** - Big data processing
  - Hadoop
  - Spark

- **Kinesis** - Real-time streaming data
  - Data Streams
  - Data Firehose
  - Data Analytics

- **Redshift** - Data warehousing

- **QuickSight** - Business intelligence

- **Glue** - ETL jobs

- **Lake Formation** - Data lakes

- **OpenSearch Service** - Search and analytics

### Integration

- **SNS** - Pub/sub messaging

- **SQS** - Message queuing

- **EventBridge** - Event bus and rules

- **Step Functions** - Workflow orchestration

- **AppFlow** - SaaS integration

- **MQ** - Message broker

### Security & Identity

- **IAM** - Identity and access management
  - Roles
  - Policies
  - Groups
  - Users

- **Cognito** - User management
  - User pools
  - Identity pools

- **Secrets Manager** - Secret rotation

- **KMS** - Key management

- **WAF** - Web application firewall

- **Shield** - DDoS protection

- **GuardDuty** - Threat detection

- **Security Hub** - Security findings

- **Inspector** - Vulnerability assessment

- **Macie** - Sensitive data discovery

### Developer Tools

- **CodePipeline** - CI/CD pipelines

- **CodeBuild** - Build automation

- **CodeDeploy** - Automated deployments

- **CodeCommit** - Source control

- **CodeArtifact** - Artifact management

- **Cloud9** - Cloud IDE

### Management & Monitoring

- **CloudWatch** - Monitoring and observability
  - Custom metrics
  - Dashboards
  - Alarms
  - Logs

- **X-Ray** - Application tracing

- **CloudTrail** - API activity tracking

- **Config** - Resource inventory and compliance

- **Organizations** - Multi-account management

- **Systems Manager** - Operations management

- **Service Catalog** - Approved services

### Serverless

- **API Gateway** - API management
  - REST APIs
  - WebSocket APIs
  - HTTP APIs

- **AppSync** - GraphQL APIs

- **Lambda** - Serverless functions
  - Layers
  - Custom runtimes

### Cost Management

- **Budgets** - Cost management

- **Cost Explorer** - Cost analysis

- **Savings Plans** - Cost optimization

### Modern Application Services

- **Amplify** - Web and mobile apps

- **AppConfig** - Feature flags

- **App Mesh** - Service mesh

- **Cloud Map** - Service discovery

- **AppFlow** - SaaS integration

### Edge & Hybrid

- **Outposts** - On-premises AWS

- **Wavelength** - Edge computing

- **Local Zones** - Low-latency applications

- **Snowball Edge** - Edge computing and data transfer

## Architecture Examples

This repository also includes complete architecture examples combining multiple services:

1. **Three-tier Web Application**
   - Auto-scaling application tier
   - Load balancing
   - Database replication
   - Content delivery via CloudFront

2. **Serverless Data Processing Pipeline**
   - Event-driven architecture
   - ETL workflows with Lambda and Step Functions
   - Real-time analytics

3. **Machine Learning Workflow**
   - Data preparation with Glue
   - Model training with SageMaker
   - Inference endpoints
   - Model monitoring

4. **Multi-region High Availability Architecture**
   - Active-active configuration
   - Global routing with Route 53
   - Data replication
   - Failover capabilities

5. **Security-focused Infrastructure**
   - Defense-in-depth strategy
   - Network segmentation
   - Encryption at rest and in transit
   - Comprehensive logging and monitoring

## Usage

Each service directory contains:

1. A README with specific documentation
2. Terraform modules with well-documented variables
3. Example implementations
4. Testing scripts where applicable

To use any module:

```hcl
module "service_name" {
  source = "./modules/service_category/service_name"
  
  # Required variables
  variable_1 = "value_1"
  variable_2 = "value_2"
  
  # Optional variables with defaults
  # variable_3 = "custom_value"
}
```

## Prerequisites

- Terraform (version 1.0.0 or newer)
- AWS CLI configured with appropriate credentials
- Basic understanding of AWS services
- Knowledge of Terraform and HCL

## Contribution Guidelines

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-service`)
3. Implement your changes
4. Add thorough documentation
5. Include tests where applicable
6. Submit a Pull Request

Please adhere to the established patterns and best practices found in existing modules.

## Roadmap

- Add more complex architecture examples
- Implement cost optimization techniques
- Add monitoring and alerting templates
- Expand security hardening examples
- Include deployment pipelines for infrastructure

## License
This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments
- AWS Documentation
- Terraform Registry
- HashiCorp Learn
- AWS Well-Architected Framework

---

Contact: [boccutothomas@outlook.com]
