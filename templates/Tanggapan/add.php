<?php
/**
 * @var \App\View\AppView $this
 * @var \App\Model\Entity\Tanggapan $tanggapan
 */

use Cake\I18n\FrozenTime;
$time = FrozenTime::now();

$authUser = $this->request->getAttribute('identity');
?>

<?php
$this->assign('title', __('Add Tanggapan'));
$this->Breadcrumbs->add([
    ['title' => __('Home'), 'url' => '/'],
    ['title' => __('List Tanggapan'), 'url' => ['action' => 'index']],
    ['title' => __('Add')],
]);
?>

<div class="card card-primary card-outline">
    <?= $this->Form->create($tanggapan, ['valueSources' =>['query', 'context']]) ?>
    <div class="card-body">
        <?= $this->Form->control('tg_pengaduan',['value'=> $time->i18nFormat('yyyy-MM-dd HH:mm:ss'),'readonly'=>true]) ?>
        <?= $this->Form->control('isi_tanggapan') ?>
        <?= $this->Form->control('petugas_id', ['options' => $petugas, 'class' => 'form-control']) ?>
        <?= $this->Form->control('pengaduan_id', ['options' => $pengaduan, 'class' => 'form-control']) ?>
    </div>
    <div class="card-footer d-flex">
        <div class="ml-auto">
            <?= $this->Form->button(__('Save'), ['class' => 'btn btn-primary']) ?>
            <?= $this->Html->link(__('Cancel'), ['action' => 'index'], ['class' => 'btn btn-default']) ?>
        </div>
    </div>
    <?= $this->Form->end() ?>
</div>