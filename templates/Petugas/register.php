<?php
    /**
    * @var \App\View\AppView $this
    */
    $this->layout = 'CakeLte.login';
?>
<div class="card">
    <div class="card-body register-card-body">
        <p class="login-box-msg"><?= __('Daftar Pengguna Baru') ?></p>
        <?= $this->Form->create($petuga, ['valueSources' => ['query', 'context']]) ?>
        <?= $this->Form->control('nik', [
            'placeholder' => __('Nomor Induk Kependudukan'),
            'label' => false,
            'append' => '<i class="fas fa-id-badge"></i>',
        ]) ?>

        <?= $this->Form->control('nama', [
            'placeholder' => __('Nama'),
            'label' => false,
            'append' => '<i class="fas fa-id-card"></i>',
        ]) ?>

        <?= $this->Form->control('username', [
            'placeholder' => __('Username'),
            'label' => false,
            'append' => '<i class="fas fa-user"></i>',
        ]) ?>

        <?= $this->Form->control('password', [
            'placeholder' => __('Password'),
            'label' => false,
            'append' => '<i class="fas fa-lock"></i>',
        ]) ?>

        <?= $this->Form->control('telp', [
            'placeholder' => __('Nomor Telepon'),
            'label' => false,
            'append' => '<i class="fas fa-phone"></i>',
        ]) ?>

        <?= $this->Form->control('level',['type'=>'hidden','value'=>'masyarakat']) ?>
        <div class="row">
            <div class="col-8">
            </div>
            <div class="col-4">
                <?= $this->Form->control(__('Daftar'), [
                    'type' => 'submit',
                    'class' => 'btn btn-primary btn-block',
                ]) ?>
            </div>
        </div>
        <?= $this->Form->end() ?>
        <?= $this->Html->link(__('Sudah Punya akun'), ['action' => 'login']) ?>
    </div>
</div>