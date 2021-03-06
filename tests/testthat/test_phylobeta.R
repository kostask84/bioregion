context("phylo_beta")

## generate data

library(bioregion)
library(betapart)
library(ape)

tree <- read.tree(text ="((t1:1,t2:1)N2:1,(t3:1,t4:1)N3:1)N1;")
com <- matrix(c(1,0,1,1,0,0,
                1,0,0,1,1,0,
                1,1,1,1,1,1,
                0,0,1,1,0,1), 6, 4,
                dimnames=list(paste0("g",1:6), tree$tip.label))
pd_bioregion <- PD(com, tree)
pbc_phyloregion <- phylobeta_core(com, tree)
pbc_betapart <- phylo.betapart.core(com, tree)


fdir <- system.file("extdata", package = "phyloregion")
comm <- read.community(file.path(fdir, "Korea_PRESAB_sample.csv"))
tree <- read.tree(file.path(fdir, "PhytoPhylo.tre"))

pc <- match_phylo_comm(tree, comm)
pb_tree <- phylo_builder(colnames(comm), tree)

test_that("read.community works", {
  ## common subtrees should be identical
  expect_is(comm, "Matrix")
  expect_is(pc$comm, "Matrix")
})


test_that("phylo_builder works", {
  ## common subtrees should be identical
  expect_is(pc$phy, "phylo")
  expect_is(pb_tree, "phylo")
  expect_gt(Ntip(pb_tree), Ntip(pc$phy))
  expect_false(is.binary(pb_tree))
})

test_that("phylobeta_core works", {
  ## common subtrees should be identical
  expect_equal(phylo.beta.multi(pbc_phyloregion),
               phylo.beta.multi(pbc_betapart))
  expect_equivalent(phylo.beta.pair(pbc_phyloregion),
                    phylo.beta.pair(pbc_betapart))

})


# test pd compare with picante
# test
