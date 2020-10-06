<?php

namespace S\VentasBundle\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;
use S\VentasBundle\Entity\Personas;
use S\VentasBundle\Form\PersonasType;
use S\VentasBundle\Entity\Ventas;

/**
 * Personas controller.
 *
 * @Route("/personas")
 */
class PersonasController extends Controller
{
    
    private function ActualizarPersonal()
    {
        $entity = new Personas();
            $em = $this->getDoctrine()->getManager();
            $entities1 = $em->getRepository('SVentasBundle:Ventas')->listarsugao();


        foreach ($entities1 as $personal){
            $em2 = $this->getDoctrine()->getManager();
            $entity = new Personas();
            $entity2 = $em2->getRepository('SVentasBundle:Personas')->findByCedula($personal["cedula"]);
            if ($entity2) {
                $entity = $entity2[0];
            }
            $entity->setNacionalidad("V");
            $entity->setCedula($personal["cedula"]);
            $entity->setPrimerNombre(utf8_encode($personal["nombre"]));
            $entity->setSegundoNombre(utf8_encode($personal["nombre2"]));
            $entity->setPrimerApellido(utf8_encode($personal["apellido"]));
            $entity->setSegundoApellido(utf8_encode($personal["apellido2"]));
            $entity->setTipoPersonal($personal["tipo_nomina"]);
            $entity->setEstatus($personal["estatus_nomina"]);
            $entity->setUnidadAdministrativa(utf8_encode($personal["unidad_administrativa"]));
            $entity->setUbucacionFuncional(utf8_encode($personal["ubicacion_funcional"]));
            $entity->setDescripcionEstatusNomina(utf8_encode($personal["descripcion_estatus_nomina"]));
            $entity->setCodigoNomina($personal["codigo_nomina"]);
            $entity->setNomina(utf8_encode($personal["nomina"]));
            $entity->setNominaCestaticket(utf8_encode($personal["nomina_cestaticket"]));
            $em2->persist($entity);
            $em2->flush();
            
                
        }
        return "Finalizo";
    }

    /**
     * Lists all Personas entities.
     *
     * @Route("/", name="personas")
     * @Method("GET")
     * @Template()
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();
        $this->ActualizarPersonal();
        $entities = $em->getRepository('SVentasBundle:Personas')->findBy(array('estatus'=>array(0,1,3,4)),array('cedula' => 'ASC'));
        //Paginador del menu. 
        $paginator  = $this->get('knp_paginator');
        $pagination = $paginator->paginate(
        $entities,
        $this->get('request')->query->get('page', 1)/*page number*/,
         20/*limit per page*/);
        // parameters to template
        return $this->render('SVentasBundle:Personas:index.html.twig', array('pagination' => $pagination,'entities'=>$entities));
    }
    /**
     * Creates a new Personas entity.
     *
     * @Route("/", name="personas_create")
     * @Method("POST")
     * @Template("SVentasBundle:Personas:new.html.twig")
     */
    public function createAction(Request $request)
    {
        $entity = new Personas();
        $form = $this->createCreateForm($entity);
        $form->handleRequest($request);

        if ($form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $entity2 = $em->getRepository('SVentasBundle:Personas')->findByCedula($entity->getCedula());

            if ($entity2) {
                $entity = $entity2[0];
                $entity->setEstatus('1');
                $em->persist($entity); 
            }  else {
                $em->persist($entity); 
            } 
            $em->flush();
            $bitacora = $em->getRepository('SVentasBundle:Bitacora')->crear('Personas',$entity->getId(),$entity,$this->getUser()->getId(),$_SERVER['REMOTE_ADDR']);
            $em->persist($bitacora); 
            $em->flush();

            return $this->redirect($this->generateUrl('personas_show', array('id' => $entity->getId())));
        }

        return array(
            'entity' => $entity,
            'form'   => $form->createView(),
        );
    }

    /**
     * Creates a form to create a Personas entity.
     *
     * @param Personas $entity The entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createCreateForm(Personas $entity)
    {
        $form = $this->createForm(new PersonasType(), $entity, array(
            'action' => $this->generateUrl('personas_create'),
            'method' => 'POST',
        ));

        $form->add('submit', 'submit', array('label' => 'Crear','attr' => array('class' => 'btn btn-default')));

        return $form;
    }

    /**
     * Displays a form to create a new Personas entity.
     *
     * @Route("/new", name="personas_new")
     * @Method("GET")
     * @Template()
     */
    public function newAction()
    {
        $entity = new Personas();
        $entity->setEstatus(1);
        $form   = $this->createCreateForm($entity);

        return array(
            'entity' => $entity,
            'form'   => $form->createView(),
        );
    }

    /**
     * Finds and displays a Personas entity.
     *
     * @Route("/{id}", name="personas_show")
     * @Method("GET")
     * @Template()
     */
    public function showAction($id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('SVentasBundle:Personas')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Personas entity.');
        }

        $deleteForm = $this->createDeleteForm($id);

        return array(
            'entity'      => $entity,
            'delete_form' => $deleteForm->createView(),
        );
    }

    /**
     * Displays a form to edit an existing Personas entity.
     *
     * @Route("/{id}/edit", name="personas_edit")
     * @Method("GET")
     * @Template()
     */
    public function editAction($id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('SVentasBundle:Personas')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Personas entity.');
        }

        $editForm = $this->createEditForm($entity);
        $deleteForm = $this->createDeleteForm($id);

        return array(
            'entity'      => $entity,
            'form'   => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        );
    }

    /**
    * Creates a form to edit a Personas entity.
    *
    * @param Personas $entity The entity
    *
    * @return \Symfony\Component\Form\Form The form
    */
    private function createEditForm(Personas $entity)
    {
        $form = $this->createForm(new PersonasType(), $entity, array(
            'action' => $this->generateUrl('personas_update', array('id' => $entity->getId())),
            'method' => 'PUT',
        ));

        $form->add('submit', 'submit', array('label' => 'Editar','attr' => array('class' => 'btn btn-default')));

        return $form;
    }
    /**
     * Edits an existing Personas entity.
     *
     * @Route("/{id}", name="personas_update")
     * @Method("PUT")
     * @Template("SVentasBundle:Personas:edit.html.twig")
     */
    public function updateAction(Request $request, $id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('SVentasBundle:Personas')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Personas entity.');
        }

        $deleteForm = $this->createDeleteForm($id);
        $editForm = $this->createEditForm($entity);
        $editForm->handleRequest($request);

        if ($editForm->isValid()) {
            $em->flush();
            $bitacora = $em->getRepository('SVentasBundle:Bitacora')->editar('Personas',$entity->getId(),$entity,$this->getUser()->getId(),$_SERVER['REMOTE_ADDR']);
            $em->persist($bitacora); 
            $em->flush();

            return $this->redirect($this->generateUrl('personas_edit', array('id' => $id)));
        }

        return array(
            'entity'      => $entity,
            'form'   => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        );
    }
    /**
     * Deletes a Personas entity.
     *
     * @Route("/{id}", name="personas_delete")
     * @Method("DELETE")
     */
    public function deleteAction(Request $request, $id)
    {
        $form = $this->createDeleteForm($id);
        $form->handleRequest($request);

        if ($form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $entity = $em->getRepository('SVentasBundle:Personas')->find($id);

            if (!$entity) {
                throw $this->createNotFoundException('Unable to find Personas entity.');
            }
            $entity->setEstatus(2);
            //$em->remove($entity);
            $em2 = $this->getDoctrine()->getManager();
            $bitacora = $em2->getRepository('SVentasBundle:Bitacora')->eliminar('Personas',$entity->getId(),$entity,$this->getUser()->getId(),$_SERVER['REMOTE_ADDR']);
            $em2->persist($bitacora); 
            $em2->flush();
            $em->flush();
        }

        return $this->redirect($this->generateUrl('personas'));
    }

    /**
     * Creates a form to delete a Personas entity by id.
     *
     * @param mixed $id The entity id
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm($id)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('personas_delete', array('id' => $id)))
            ->setMethod('DELETE')
            ->add('submit', 'submit', array('label' => 'Eliminar','attr' => array('class' => 'btn btn-default')))
            ->getForm()
        ;
    }
    
    /**
     * Lists all Personas entities.
     *
     * @Route("/buscar/", name="buscarpersonas")
     * @Method("GET")
     * @Template()
     */
    public function buscarAction()
    {
        $em = $this->getDoctrine()->getManager();
        //$this->ActualizarPersonal();
        $entities = $em->getRepository('SVentasBundle:Personas')->findBy(array('estatus'=>array(0,1,3,4)),array('cedula' => 'ASC'));
        $form = $this->createFormBuilder()
            ->add('cedulas')
            ->setAction($this->generateUrl('listaPerEventonew'))
            ->add('buscar', 'submit', array('label' => 'buscar','attr' => array('class' => 'btn btn-default')))
            ->getForm();
        //Paginador del menu. 
        $paginator  = $this->get('knp_paginator');
        $pagination = $paginator->paginate(
        $entities,
        $this->get('request')->query->get('page', 1)/*page number*/,
         20/*limit per page*/);
        // parameters to template
        return $this->render('SVentasBundle:Personas:buscar.html.twig', array('pagination' => $pagination,'entities'=>$entities,'form'=>$form));
    }
}
