import au.gov.nla.pipeline.Git

final Git git = new Git(this)

if (git.isMasterBranch()) {
    node("hammer") {
        stage("Deploy to dev") {
            sh "sudo jvmctl deploy dl-solr"
        }
    }
}
