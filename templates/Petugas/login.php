<?php
$this->layout = 'CakeLte.login';
?>
<div class="card">
    <div class="card-body login-card-body">
        <p class="login-box-msg"><?= __('Silahkan Login Terlebih dahulu') ?></p>
        <?= $this->Form->create() ?>
        <?= $this->Form->control('username', [
            'label' => false,
            'placeholder' => __('Username'),
            'append' => '<i class="fas fa-user"></i>',
        ]) ?>
        <?= $this->Form->control('password', [
            'label' => false,
            'placeholder' => __('Password'),
            'append' => '<i class="fas fa-lock"></i>',
        ]) ?>
        
        <div class="row">
            <div class="col-8">
            </div>
            <div class="col-4">
                <?= $this->Form->control(__('Login'), ['type' => 'submit', 'class' => 'btn btn-primary btn-block']) ?>
            </div>
        </div>
        <?= $this->Form->end() ?>
        <p class="mb-0">
            <?= $this->Html->link(__('Belum Punya Akun?Daftar Sekarang!'), ['action' => 'register']) ?>
        </p>
    </div>
</div>