<?php

namespace S\VentasBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolverInterface;

use Doctrine\ORM\EntityRepository;
use S\VentasBundle\Entity\Eventos;
use S\VentasBundle\Entity\Productos;

class EventoProductosType extends AbstractType
{
    /**
     * @param FormBuilderInterface $builder
     * @param array $options
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            //->add('idEvento', null, array('label' => 'Evento ','empty_value' => 'Seleccione',  "required"=> true))
            ->add('idEvento')
            //->add('idProducto', null, array('label' => 'Producto ','empty_value' => 'Seleccione',  "required"=> true))
            ->add('idProducto', 'entity', array(
                'label' => 'Producto ','empty_value' => 'Seleccione',  "required"=> true,
                'class' => 'S\VentasBundle\Entity\Productos',
                'query_builder' => function(EntityRepository $er ){
                    return $er->createQueryBuilder('w')
                  ->orderBy('w.id', 'ASC')
                  ->where('w.estatus = 1');
              }))
            ->add('precio')
            ->add('cantidad')
        ;
    }
    
    /**
     * @param OptionsResolverInterface $resolver
     */
    public function setDefaultOptions(OptionsResolverInterface $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'S\VentasBundle\Entity\EventoProductos'
        ));
    }

    /**
     * @return string
     */
    public function getName()
    {
        return 's_ventasbundle_eventoproductos';
    }
}
