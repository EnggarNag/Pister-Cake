<div class="container">

	<!-- Alert -->
	<?php $this->load->view('layouts/_alert') ?>
	<!-- End of alert -->

	<!-- Hero -->
	<div class="row mt-5">
		<div class="col">
			<img src="<?= base_url() ?>/images/cake/<?= $cake['image'] ?>" class="card-img-top" alt="<?= $cake['name'] ?>" style="width: 330px">
		</div>
		<div class="col-5">
			<h2 class="font-weight-bold"><?= $cake['name'] ?></h2>
			<h4 class="font-weight-normal"><?= ucfirst($cake['edition']) ?> Edition</h4>
			<br> <br>
			<p><?= character_limiter($cake['description'], 200) ?></p>
			<a href="#description" class="text-info font-weight-bold">View more</a>
			<br> <br>
			<p class="font-weight-bold">EDITION</p>
			<h5><span class="badge badge-info badge-pill p-2"><?= ucfirst($cake['edition']) ?></span></h5>
		</div>
		<div class="col">
			<div class="card">
				<div class="card-body text-center">
					<h2 class="text-center text-warning price mt-4 mb-4">Rp.<?= number_format($cake['price'], 2, ', ', '.'); ?></h2>
					<form action="<?= base_url('cart/add') ?>" method="POST">
						<input type="hidden" name="product_id" value="<?= $cake['id'] ?>">
						<button type="submit" class="btn btn-large btn-success btn-block badge-pill mb-4">ADD TO CART</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- End of hero -->

	<!-- Summary -->
	<div class="row mt-5 mb-2">
		<div class="col">
			<h3 id="description">Description</h3>
		</div>
	</div>

	<div class="row">
		<div class="col bg-light p-5">
			<?= $cake['description'] ?>
		</div>
	</div>
	<!-- End of summary -->

	<?php $this->load->view('layouts/_footer') ?>