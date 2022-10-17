<!-- List Item -->
<div class="container">
	<div class="row mt-5">
		<div class="col">
			<h2 class="head">Our Cakes</h2>
			<hr>
		</div>
	</div>

	<div class="row mb-5">
		<?php foreach ($cakes as $cake) : ?>
			<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 mt-4">
				<div class="card">
					<img src="<?= base_url() ?>/images/cake/<?= $cake['image'] ?>" class="card-img-top" alt="<?= $cake['name'] ?>">
					<div class="card-body">
						<h6 class="card-title font-weight-bold"><?= $cake['name'] ?></h6>
						<h6 class="text-muted"><?= ucfirst($cake['edition']) ?> Edition</h6>
						<h3 class="text-right text-warning price mt-4">Rp.<?= number_format($cake['price'], 2, ', ', '.'); ?></h3>
						<a href="<?= base_url('home/detail/' . $cake['id']) ?>" class="btn btn-outline-info btn-sm btn-block mt-3">See More</a>
					</div>
				</div>
			</div>
		<?php endforeach; ?>
	</div>
</div>
<!-- End of List Item -->

<!-- Footer -->
<?php $this->load->view('layouts/_footer') ?>
<!-- End of footer -->