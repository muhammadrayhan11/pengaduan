<?php
/**
 * @var \App\View\AppView $this
 * @var \App\Model\Entity\Petuga $petuga
 */
?>

<?php
$this->assign('title', __('Edit Petugas'));
$this->Breadcrumbs->add([
    ['title' => __('Home'), 'url' => '/'],
    ['title' => __('List Petugas'), 'url' => ['action' => 'index']],
    ['title' => __('View'), 'url' => ['action' => 'view', $petuga->id]],
    ['title' => __('Edit')],
]);
?>

<div class="card card-primary card-outline">
    <?= $this->Form->create($petuga) ?>
    <div class="card-body">
        <?= $this->Form->control('nik') ?>
        <?= $this->Form->control('nama') ?>
        <?= $this->Form->control('username') ?>
        <?= $this->Form->control('password') ?>
        <?= $this->Form->control('telp') ?>
        <?= $this->Form->control('level') ?>
    </div>
    <div class="card-footer d-flex">
        <div class="mr-auto">
            <?= $this->Form->postLink(
                __('Delete'),
                ['action' => 'delete', $petuga->id],
                ['confirm' => __('Are you sure you want to delete # {0}?', $petuga->id), 'class' => 'btn btn-danger']
            ) ?>
        </div>
        <div class="ml-auto">
            <?= $this->Form->button(__('Save'), ['class' => 'btn btn-primary']) ?>
            <?= $this->Html->link(__('Cancel'), ['action' => 'view', $petuga->id], ['class' => 'btn btn-default']) ?>
        </div>
    </div>
    <?= $this->Form->end() ?>
</div>